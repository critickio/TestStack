module Pages

  module Web
    class Application
      def initialize
         @pages = {}
      end

     def home
         @pages[:home] ||= Pages::Web::HomePage.new
     end

     def entrepreneurship
         @pages[:entrepreneurship] ||= Pages::Web::Entrepreneurship.new
     end

     def applications
         @pages[:applications] ||= Pages::Web::Applications.new
     end

     def preview
         @pages[:preview] ||= Pages::Web::Preview.new
     end

    end
  end

  module WebApp
    class Application
      def initialize
         @pages = {}
      end

      def login
          @pages[:login] ||= Pages::WebApp::LoginPage.new
      end

      def dashboard
          @pages[:dashboard] ||= Pages::WebApp::Dashboard.new
      end

    end
  end


  module MobileApp
     class Application

       def initialize
         @pages = {}
       end

       def home
         @pages[:home] ||= Pages::App::HomePage
       end

     end
  end


  module API
     class Application

       def initialize
          @apis = {}
       end

       def signup
          @apis[:signup] ||= Pages::API::Signup.new
       end

       def login
          @apis[:login] ||= Pages::API::Login.new
       end

       def questions
          @apis[:questions] ||= Pages::API::Questions.new
       end

       def answers
          @apis[:answers] ||= Pages::API::Answers.new
       end

       def comments
          @apis[:comments] ||= Pages::API::Comments.new
       end

       def voteanswer
          @apis[:voteanswer] ||= Pages::API::VoteAnswer.new
       end

       def votequestion
          @apis[:votequestion] ||= Pages::API::VoteQuestion.new
       end

       def bookmark
          @apis[:bookmark] ||= Pages::API::Bookmark.new
       end

     end
  end
end
