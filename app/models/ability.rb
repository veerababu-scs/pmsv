# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(admin)
    # Define abilities for the passed in user here. For example:
    #alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :create, :read, :update, :destroy, to: :crud
    puts ".....checking......."
    puts admin.name
      admin ||= Admin.new # guest user (not logged in)
      if admin.role == "super_admin"

        # can :crud, :all
        # can :invite, :all
        can :manage, :all
      else
        #can :read, :all
      end

      if admin.role == "sub_admin"
         can :manage, :all
        puts "You are sub_admin and limited permissions"
      end
      if admin.role == "admin"
        puts "You are admin and major permissions"
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
