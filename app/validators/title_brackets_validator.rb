class TitleBracketsValidator < ActiveModel::Validator

  OPENING_PARENTHESES = ['(', '{', '['].freeze
  CLOSING_PARENTHESES = [')', '}', ']'].freeze

  def validate(record)
    return error_add record if blank_word? record
    only_closing_parentheses? record
    malformed_parentheses_position? record
  end

  def blank_word?(record)
    string = record.title.split
    string.include?('()') or string.include?('{}') or string.include?('[]')
  end

  def only_closing_parentheses?(record)
    title = record.title.split(//)
    OPENING_PARENTHESES.each_with_index do |bracket, i|
      error_add record unless title.count(bracket) == title.count(CLOSING_PARENTHESES[i])
    end
  end

  def malformed_parentheses_position? record
    string = record.title.split(//)
    first_parentheses = string.index('(')
    second_parentheses = string.index(')')
    unless first_parentheses.nil? or second_parentheses.nil?
      error_add record unless second_parentheses > first_parentheses
    end
  end

  def error_add record
    record.errors.add(:title)
  end
end
