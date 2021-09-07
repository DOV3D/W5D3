require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
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

  def self.find_by_id(id) 
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        question_id == ? 
    SQL

    # data = QuestionsDatabase.instance.execute(<<-SQL, id)
    #   SELECT 
    #     * 
    #   FROM 
    #     questions 
    #   WHERE 
    #     id == ?
    # SQL 

  end 

end

# class Users

#   def self.all 
#     data = QuestionsDatabase.instance.execute('SELECT * FROM users')
#     data.map { |datum| Questions.new(datum) }
#   end

#   def initialize(options)
#     @user_id = options['user_id']
#     @fname = options['fname']
#     @lname = options['lname']
#   end

# end

# class QuestionFollows

#   def self.all 
#     data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
#     data.map { |datum| Questions.new(datum) }
#   end

#   def initialize(options)
#     @pair_id = options['pair_id']
#     @follower_id = options['follower_id']
#     @asked_question_id = options['asked_question_id']

#   end

# end

# class Replies

#   def self.all 
#     data = QuestionsDatabase.instance.execute('SELECT * FROM replies')
#     data.map { |datum| Questions.new(datum) }
#   end

#   def initialize(options)
#     @reply_id = options['reply_id']
#     @body = options['body']
#     @question_id = options['question_id']
#     @parent_reply = options['parent_reply']
#     @replier_id = options['replier_id']

#   end

# end

# class QuestionLikes

#   def self.all 
#     data = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
#     data.map { |datum| Questions.new(datum) }
#   end

#   def initialize(options)
#     @likes_id = options['likes_id']
#     @user_id = options['user_id']
#     @question_id = options['question_id']
#   end

# end