class AssistancePolicy
    attr_reader :user, :assistance

    def initialize(user, assistance)
      @user = user
      @assistance = assistance
    end

    def index?
      true
    end

    def show?
      !@assistance.nil?
    end

    def create?
      !@user.nil?
    end

    def new?
      create?
    end

    def update?
      !@user.nil? && @assistance.user = @user
    end

    def edit?
      update?
    end

    def destroy?
      update?
    end
  end
