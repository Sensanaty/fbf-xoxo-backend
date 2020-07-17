class ScoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :wins, :draws, :losses
end
