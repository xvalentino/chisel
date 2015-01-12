require_relative 'chisel'

document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."'

parser = Chisel.new
output = parser.parse(document)
puts output
