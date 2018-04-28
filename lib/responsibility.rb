class Responsibility
  attr_reader :task_name, :repo, :command
  def initialize(logger, options)
    @task_name = options[:task_name] if options.has_key? :task_name
    @repo = options[:task_name] if options.has_key? :task_name
    @command = options[:command] if options.has_key? :command
    @playbook = options[:playbook] if options.has_key? :playbook
  end

  def run
    checkout_repo
    if @command.present?
      command_executer
    elsif @playbook.present?

    end
  end

  private

  def checkout_repo
    # git checkout repo
  end

  def command_executer
    # run shell command
  end

  def ansible_executor
    # run shell command
    `ansible-playbook #{@playbook}`
  end
end
