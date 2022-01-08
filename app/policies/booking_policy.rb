class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def approve?
    is_host?
  end

  def decline?
    is_host?
  end

  private

  def is_host?
    record.flat.user == user
  end
end
