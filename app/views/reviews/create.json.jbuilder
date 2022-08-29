if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {movie: @movie, review: Review.new})
  json.inserted_item render(partial: "movies/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {movie: @movie, review: @review})
end
