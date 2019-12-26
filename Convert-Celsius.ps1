function ConvertTo-Celsius {
    
<#
.SYNOPSIS
Converts a fahrenheit temperature to a celsius temperature.
.DESCRIPTION
Converts a fahrenheit temperature to a celsius temperature. Multiple values can be specified.
.PARAMETER Values
One or more values to convert.
.EXAMPLE
ConvertTo-Celsius -Values 32, 212
.EXAMPLE
32, 212 | ConvertTo-Celsius
#>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$True,ValueFromPipeline=$True)]
        [ValidateScript({($_.GetType().Name -ne 'String')})]
        [double[]]$Values
    )
    
    BEGIN{}
    PROCESS{
        foreach ($value in $Values) {
            
            $FtoC = ($Value - 32) / 1.8
            
            $celsius = [math]::Round($FtoC,4)

            $props = @{'Celsius'="$celsius"
                       'Fahrenheit'="$value"}
        }

        $obj = New-Object -TypeName PSObject -Property $props

        Write-Output $obj
    }
    END{}
}