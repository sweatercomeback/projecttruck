module MessageHelper
  def GetFromUserName(fromUserId)
    return User.find(fromUserId).login
  end
end
