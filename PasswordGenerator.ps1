# Function to generate a secure random password
function New-Password {
    param (
        [int]$Length = 12
    )

    $validCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"
    $password = ""

    for ($i = 0; $i -lt $Length; $i++) {
        $randomIndex = Get-Random -Minimum 0 -Maximum $validCharacters.Length
        $password += $validCharacters[$randomIndex]
    }

    return $password
}

# Function to create a secure password based on a name
function Convert-NameToPassword {
    param (
        [string]$Name
    )

    # Create a password using the person's name
    $nameLength = $Name.Length
    $maxPasswordLength = 12

    # If the name is longer than the maximum password length, truncate it
    if ($nameLength -gt $maxPasswordLength) {
        $Name = $Name.Substring(0, $maxPasswordLength)
    }

    # Generate a random password using the truncated name
    $password = New-Password -Length $maxPasswordLength

    return $password
}

# Example: Generate a random password based on a name
$personName = "Justin Williams"
$generatedPassword = Convert-NameToPassword -Name $personName
Write-Host "Generated Password: $generatedPassword"
