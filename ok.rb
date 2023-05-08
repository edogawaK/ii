class Bottle
  def initialize(size, current)
    @size = size
    @current = current
  end

  def pourOut(bottle = nil)
    sizeToPour = @current
    if (bottle && !bottle.isFull)
      sizeToPour = bottle.canFill < sizeToPour ? bottle.canFill : sizeToPour
      bottle.fill(sizeToPour)
    end
    @current -= sizeToPour
    self
  end

  def fill(size = nil)
    size ||= @size
    if (size > canFill)
      size = canFill
    end
    @current += size
    self
  end

  def size
    @size
  end

  def current
    @current
  end

  def isFull
    @size == @current
  end

  def isEmpty
    @current == 0
  end

  def canFill
    @size - @current
  end

  def clone
    Bottle.new(@size, @current)
  end

  def toString
    "#{@current}/#{@size}"
  end
end

class State
  def initialize(bottle1, bottle2, target, before)
    @bottle1 = bottle1
    @bottle2 = bottle2
    @target = target
    @before = before
  end

  def isResult
    @bottle1.current == @target || @bottle2.current == @target
  end

  def find
    newStates = []

    bottle1 = @bottle1.clone()
    bottle2 = @bottle2.clone()

    bottle1.isFull || newStates.push(State.new(bottle1.clone().fill(), bottle2.clone(), @target, self))
    bottle1.isEmpty || newStates.push(State.new(bottle1.clone().pourOut(), bottle2.clone(), @target, self))
    bottle1.isEmpty || newStates.push(State.new(bottle1.clone().pourOut(bottle2), bottle2, @target, self))

    bottle1 = @bottle1.clone()
    bottle2 = @bottle2.clone()

    bottle2.isFull || newStates.push(State.new(bottle1.clone(), bottle2.clone().fill(), @target, self))
    bottle2.isEmpty || newStates.push(State.new(bottle1.clone(), bottle2.clone().pourOut(), @target, self))
    bottle2.isEmpty || (bottle2.clone().pourOut(bottle1) && newStates.push(State.new(bottle1, bottle2, @target, self)))

    newStates
  end

  def show
    "#{@bottle1.toString()}&&#{@bottle2.toString()}"
  end
end

initState = State.new(Bottle.new(8, 0), Bottle.new(5, 0), 4, nil)
opens = []
closes = {}
current = initState
result = nil

while (true)
  if (opens.size == 0)
    break
  end

  current = opens[0]
  opens.delete_at(0)

  if (closes[current.show])
    closes[current.show] = true
    next
  end

  if (current.isResult())
    result = current
    break
  end

  opens.push(*current.find)
  closes[current.show] = true
end

i = []

while (result)
  i.push(result)
  result = result.before
end
