class GistQuestionService

  attr_reader :client

  def initialize(question, user)
    @user = user
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def create
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
    description: I18n.t('test_passage.gist.description'),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
