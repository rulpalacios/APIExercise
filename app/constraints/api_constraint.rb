class ApiConstraint
  MIME_TYPE_REGEXP = /\A(application\/json|application\/vnd\.store\.v\d\+json)\z/

  def matches?
    request.headers['ACCEPT'].match?(MIME_TYPE_REGEXP)
  end
end