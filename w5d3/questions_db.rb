class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.result_as_hash = true
  end
end

class Questions

  def self.all 
    data = QuestionsDatabase.instance.execute('SELECT * FROM questions')
    data.map { |datum| Questions.new(datum) }
  end

  def initialize(options)
    @question_id = options['question_id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

end

class Users

  def self.all 
    data = QuestionsDatabase.instance.execute('SELECT * FROM users')
    data.map { |datum| Questions.new(datum) }
  end

  def initialize

  end

end

class QuestionFollows

  def self.all 
    data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
    data.map { |datum| Questions.new(datum) }
  end

  def initialize

  end

end

class Replies

  def self.all 
    data = QuestionsDatabase.instance.execute('SELECT * FROM replies')
    data.map { |datum| Questions.new(datum) }
  end

  def initialize

  end

end

class QuestionLikes

  def self.all 
    data = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
    data.map { |datum| Questions.new(datum) }
  end

  def initialize

  end

end