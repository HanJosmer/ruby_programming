def caesar_cipher plaintext, shift

    # check that shift is an integer
    if !shift.integer?
        return "Shift value is not an integer"
    end

    # split plaintext into array and perform shift
    ciphertext = Array.new
    plaintext.chars.each do |chr|
        if chr.match(/^[[:alpha:]]$/)
            shift.times do
                chr.next!
            end
            ciphertext.push(chr.reverse.chr)
        else
            ciphertext.push(chr)
        end
    end
    return ciphertext.join()
end