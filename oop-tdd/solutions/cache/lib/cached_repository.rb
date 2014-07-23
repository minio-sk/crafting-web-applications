class CachedRepository
  def initialize(repository)
    @repository = repository
    @cache = {}
  end

  def find(id)
    @cache[id] = @repository.find(id) unless @cache.include?(id)
    @cache[id]
  end
end