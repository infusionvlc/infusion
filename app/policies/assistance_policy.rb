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

    def report?
      @user && !Report.where(reportable_id: @assistance.id,
                             reportable_type: 'Assistance',
                             user_id: @user.id).exists?
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
