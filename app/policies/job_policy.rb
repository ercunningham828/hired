class JobPolicy < ApplicationPolicy
  attr_reader :user, :job

  def index
    true
  end

  def show
    true
  end
  
  def initialize(user, job)
    @user = user
    @job= job
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    user.present?
  end

end