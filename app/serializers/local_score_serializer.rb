class LocalScoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :wins, :draws, :losses
end
