class Cts::Ability
  include CanCan::Ability

  def initialize(user: nil, application: nil)
    can :read, Cts::Stop
  end
end
