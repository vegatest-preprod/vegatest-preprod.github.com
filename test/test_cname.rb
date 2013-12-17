require 'test/unit'

module Test
  class TestHomePage < Test::Unit::TestCase

    PRODUCTION_REPOSITORY = "edmundsapi.github.com"

    def test_cname
      repository = `git remote -v`

      file = File.open("CNAME", "r")
      cname = file.read.gsub!(/\s+/, "")
      file.close

      if repository.include? PRODUCTION_REPOSITORY
        verify = cname == "developer.edmunds.com"
      else
        verify = repository.include? cname
      end
      assert(verify, "CNAME is not valid")
    end

  end
end