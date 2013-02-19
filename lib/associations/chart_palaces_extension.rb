module Associations
  module ChartPalacesExtension
    def [](indexer)
      if indexer.kind_of?(Branch)
        by_location(indexer)
      elsif indexer.kind_of?(String) || indexer.kind_of?(Symbol)
        by_location(Branch.by_name(indexer))
      else
        by_palace_ordinal(indexer)
      end
    end

    def by_location(branch)
      select{|t| t.location == branch}.first
    end

    def by_palace_ordinal(i)
      select{|t| t.palace.ordinal==i}.first
    end
    
    def by_palace(palace)
      select{|t| t.palace == palace}.first
    end
  end
end