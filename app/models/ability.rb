# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(admin)
    # Define abilities for the passed in user here. For example:
    #alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :create, :read, :update, :destroy, to: :crud
    puts ".....checking......."
    puts admin.email
      admin ||= Admin.new # guest user (not logged in)
      if admin.role == "super_admin"
        puts "You are a super_admin and you have all permissions"
        can :manage, :all
      end

      if admin.role == "sub_admin"
        puts "You are a sub_admin and you have limited permissions"
        can :access, :rails_admin
        can :manage, :dashboard
        can [:read,:destroy], User
      end

      if admin.role == "admin"
        puts "You are a admin and you have major permissions"
        can :access, :rails_admin
        can :manage, :dashboard
        puts ".....Admin Read Operation....."
        arr = admin.read_action
        for i in arr do
        can :read,i.constantize
        end
        puts ".....Admin Create Operation....."
        arr = admin.create_action
        for i in arr do
        can :create,i.constantize
        end
        puts ".....Admin Update Operation....."
        arr = admin.update_action
        for i in arr do
        can :update,i.constantize
        end
        puts ".....Admin Delete Operation....."
        arr = admin.delete_action
        for i in arr do
        can :destroy,i.constantize
        end
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
