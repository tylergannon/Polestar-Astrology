module Extensions
  module ArrayExtensions
    def to_english_list(last_separator='and')
      if size == 0
        ""
      elsif size == 1
        self[0].to_s
      elsif size == 2
        self.join(" #{last_separator} ")
      else
        self[0..(self.size-2)].join(", ") + " #{last_separator} " + self.last
      end
    end
  end
end