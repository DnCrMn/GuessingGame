-- Guessing game psuedocode converted into a lua script.
math.randomseed(os.time()) -- Generate seed for rng

repeat
    local tries = 7
    local won = false
    local num = math.random(1, 100)

    while not won and tries > 0 do
        print("Tries: " .. tries)

        local guess
        repeat
            io.write("Guess a number from 1 to 100: ")
            guess = tonumber(io.read())

            if guess == nil or guess < 1 or guess > 100 then
                print("Input must be a number between 1 and 100. Try again.")
            end
        until guess ~= nil

        if guess == num then
            print("You have guessed the correct number. You Win!")
            won = true
        else -- Add feedback to let the player know if their guess is high or low
            tries = tries - 1
            if guess > num then
                print("Your guess was too high!")
            else
                print("Your guess was too low!")
            end
        end

        print()
    end

    if not won then
        print("You have no more tries left.")
        print("The number was: " .. num)
        print("Game over.")
    end

    print()

    local input
    repeat
        io.write("Would you like to try again (y/n)? ")
        input = string.upper(io.read())

        if input ~= "Y" and input ~= "N" then
            print("Invalid input. Try again.")
        end
    until input == "Y" or input == "N"
until input == "N"

print("Thank you for playing my guessing game!")
