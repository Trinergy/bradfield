# 02/04/2019 - Building a VM to understand the fetch, decode, execute cycle

program = [
      0x01, 0x01, 0x10,
      0x01, 0x02, 0x12,
      0x03, 0x01, 0x02,
      0x02, 0x01, 0x0e,
      0xff,
      0x00,
      0x00, 0x00,
      0xa1, 0x14,
      0x0c, 0x00
    ]

INSTRUCTIONS = {
  "LOAD" => 0x01,
  "STORE" => 0x02,
  "ADD" => 0x03,
  "SUB" => 0x04,
  "HALT" => 0xff
}

registers = {
  0x01 => 0x00, # Register 1
  0x02 => 0x00 # Register 2
}

pc = 0
halt = false

while pc < program.length && !halt do
  puts "starting..."
  puts "counter: #{pc}"

  case program[pc]
  when INSTRUCTIONS["LOAD"]
    register_address = program[pc+1]
    memory_address = program[pc+2]
    memory_value = program.fetch(memory_address)

    registers.store(register_address, memory_value)

    puts "=== LOAD memory_value: #{memory_value} at memory_address: #{memory_address} to register_address: #{register_address} ==="
    pc = pc + 3
  when INSTRUCTIONS["STORE"]
    register_address = program[pc+1]
    register_value = registers.fetch(register_address)

    memory_address = program[pc+2]
    program[memory_address] = register_value

    puts "=== STORE register_value: #{register_value} at register_address: #{register_address} to memory_address: #{memory_address} ==="
    pc = pc + 3
  when INSTRUCTIONS["ADD"]
    register1_address = program[pc+1]
    register2_address = program[pc+2]
    register1_value = registers.fetch(register1_address)
    register2_value = registers.fetch(register2_address)

    registers.store(register1_address, register1_value + register2_value)

    puts "=== ADD register1_value: #{register1_value} to register2_value: #{register2_value} and store to register1_address: #{register1_address}"

    pc = pc + 3
  when INSTRUCTIONS["SUB"]
    register1_address = program[pc+1]
    register2_address = program[pc+2]
    register1_value = registers.fetch(register1_address)
    register2_value = registers.fetch(register2_address)

    registers.store(register1_address, register1_value - register2_value)

    puts "=== SUB register1_value: #{register1_value} minus register2_value: #{register2_value} and store to register1_address: #{register1_address}"

    pc = pc + 3
  when INSTRUCTIONS["HALT"]
    puts "=== HALT ==="
    puts "program state: #{program}"
    halt = true
  else
    pp "Wtf happened"
  end
end

