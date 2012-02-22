require 'digest/sha2'
 
class Person < ActiveRecord::Base
  attr_reader :password
 
  ENCRYPT = Digest::SHA256
 
  has_many :sessions, :dependent => :destroy
  belongs_to :role
  has_many :owned_projects
  has_many :owned_tasks
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :tasks
 
  validates_uniqueness_of :name, :message => "is already in use by another person"
 
  validates_format_of :name, :with => /^([a-z0-9_]{2,16})$/i,
    :message => "must be 4 to 16 letters, numbers or underscores and have no spaces"
 
  validates_format_of :password, :with => /^([\x20-\x7E]){4,16}$/,
    :message => "must be 4 to 16 characters",
    :unless => :password_is_not_being_updated?
    
  validates_format_of :email_address,
                      :with => /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}/i,
                      :message => "must be a valid address"    
 
  validates_confirmation_of :password
 
  before_save :scrub_name
  after_save :flush_passwords
 
  def self.find_by_name_and_password(name, password)
    person = self.find_by_name(name)
    if person and person.encrypted_password == ENCRYPT.hexdigest(password + person.salt)
      return person
    end
  end
 
  def password=(password)
    @password = password
    unless password_is_not_being_updated?
      self.salt = [Array.new(9){rand(256).chr}.join].pack('m').chomp
      self.encrypted_password = ENCRYPT.hexdigest(password + self.salt)
    end
  end
  
  #def role?(role) 
   
    #return !!self.roles.find_by_name(role.to_s.camelize)
  #end
  
  def role
    return Role.find(:first, :conditions => {:id => (RolesPerson.find(:first, :conditions => {:person_id => self.id})).role_id}).name
  end
 
 def self.team_members(project_id)
  # find_by_sql()
   return Person.find(:all, :conditions => "id in(select person_id from projects_people where project_id = #{project_id})")
 end
 
 def self.not_in_the_team(project_id)
   find_by_sql("select p.id, p.name from people p where not exists (select pp.person_id from projects_people pp where pp.person_id = p.id and pp.project_id = #{project_id})")#.find(:all, :conditions => "id NOT IN (select person_id from projects_people where project_id = #{project_id})")
 end
 
  private
 
  def scrub_name
    self.name.downcase!
  end
 
  def flush_passwords
    @password = @password_confirmation = nil
  end
 
  def password_is_not_being_updated?
    self.id and self.password.blank?
  end
end

