function ConvertTo-Fahrenheit {
    
<#
.SYNOPSIS
Converts a celsius temperature to a fahrenheit temperature.
.DESCRIPTION
Converts a celsius temperature to a fahrenheit temperature. Multiple values can be specified.
.PARAMETER Values
One or more values to convert.
.EXAMPLE
ConvertTo-Fahrenheit -Values 0, 100
.EXAMPLE
0, 100 | ConvertTo-Fahrenheit
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
            
            $CtoF = ($Value * 1.8) + 32
            
            $fahrenheit = [math]::Round($CtoF,4)

            $props = @{'Celsius'="$value"
                       'Fahrenheit'="$fahrenheit"}
        }

        $obj = New-Object -TypeName PSObject -Property $props

        Write-Output $obj
    }
    END{}
}