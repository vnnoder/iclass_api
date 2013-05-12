class Api::BaseController < ApplicationController
  TRUE_VALUE = 1
  FALSE_VALUE = 0

  include JsonRescuable
  respond_to :json
end