require 'Singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true

    end 

    class Question
        def self.find_by_id(id)
            question = QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.author_id)
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
    end 

    class User 
        def self.find_by_name(fname, lname)
            user = QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
            SELECT
                *
            FROM
                users
            WHERE
               fname = ?, lname = ?
            SQL
            return nil unless user.length > 0
            User.new(user.first)
        end 
    end 

    class Reply 
        def self.find_by_id(reply_id)
            reply = QuestionsDatabase.instance.execute(<<-SQL, self.reply_id, self.child_reply_id, self.body, self.author_id)
            SELECT
                *
            FROM
                replies
            WHERE
               reply_id = ?
            SQL
            return nil unless reply.length > 0
            Reply.new(reply.first)
        end 
    end 


end 
 

