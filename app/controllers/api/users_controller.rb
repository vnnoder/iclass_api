class Api::UsersController < Api::BaseController
  before_filter :authenticate_user!

end