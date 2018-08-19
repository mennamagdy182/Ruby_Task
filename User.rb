class User

# Initialize
  @@count = 0

  def initialize(i,l,av,ur,ty,si)
    @id=i
    @login = l
    @avatar_url = av
    @url = ur
    @user_type = ty
    @site_admin = si
    @@count +=1
  end

  # accessor methods
  def getID
    @id
  end
  def getLogin
    @login
  end
  def getAvatar_url
    @avatar_url
  end
  def getUrl
    @url
  end
  def getUser_type
    @user_type
  end
  def getSite_admin
    @site_admin
  end

  # setter methods
  def setID=(value)
    @id = value
  end
  def setLogin=(value)
    @login = value
  end
  def setAvatar_url=(value)
    @avatar_url = value
  end
  def setUrl=(value)
    @url = value
  end

  def setUser_type=(value)
    @user_type = value
  end

  def setSite_admin=(value)
    @site_admin = value
  end

  #Class Method
  def self.printCount()
    puts "Users count is : #@@count"
  end

  #To string Method
  def to_s
    "(ID:#@id,Login:#@login)"  # string formatting of the object.
  end

#private :getLogin

end