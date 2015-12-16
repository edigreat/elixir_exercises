defmodule ElixirExercises.ExerciseOne do
    def prefix(word_prefix) do
        fn(word) ->
          word_prefix <> " " <> word
      end
    end
end
