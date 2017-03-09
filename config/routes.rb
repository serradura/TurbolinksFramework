Rails.application.routes.draw do
  get 'statics/page_a'

  get 'statics/page_b'

  get 'statics/page_c'

  root to: "home#show"
end
