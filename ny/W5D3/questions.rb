require 'Singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end 
end 
 
class Question
    attr_reader :id
    attr_accessor :title, :body, :author_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end 

    # def self.all
    #     data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    #     data.map{|datum| Question.new(datum)}
    # end

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)

    end 

    def self.find_by_author_id(author_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            author_id = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)
    end 

end 

    # class User 
    #     attr_accessor :fname, :lname
    #     def initialize(options)
    #         @id = options['id']
    #         @fname = options['fname']
    #         @lname = options['lname']
    #     end 

    #     def self.find_by_name(fname, lname)
    #         user = QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
    #         SELECT
    #             *
    #         FROM
    #             users
    #         WHERE
    #            fname = ?, lname = ?
    #         SQL
    #         return nil unless user.length > 0
    #         User.new(user.first)
    #     end 
    # end 

    # class Reply 
    #     def initialize(options)
    #         @id = options['id']
    #         @question_id = options['question_id']
    #         @child_reply_id = options['child_reply_id']
    #         @body = options['body']
    #         @author_id = options['author_id']
    #     end 

    #     def self.find_by_user_id(user_id)
    #         reply = QuestionsDatabase.instance.execute(<<-SQL, self.id, self.reply_id, self.body, self.author_id)
    #         SELECT
    #             *
    #         FROM
    #             replies
    #         WHERE
    #            user_id = ?
    #         SQL
    #         return nil unless reply.length > 0
    #         Reply.new(reply.first)
    #     end 

    #     def self.find_by_question_id(question_id)
    #         reply = QuestionsDatabase.instance.execute(<<-SQL, self.id, self.reply_id, self.child_reply_id, self.body, self.author_id)
    #         SELECT
    #             *
    #         FROM
    #             replies
    #         WHERE
    #            question_id = ?
    #         SQL
    #         return nil unless reply.length > 0
    #         Reply.new(reply.first)
    #     end 
    # end 
