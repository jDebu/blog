class CoverImage < Image
  before_save :set_cover

  private

  def set_cover
    self.cover = true
  end
end
