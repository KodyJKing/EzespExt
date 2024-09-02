. ./config.ps1

function Get-Project($project) {
    if ($project) {
        return $project
    }

    if ($Config_StartProject) {
        return $Config_StartProject
    }

    # Get a list of directories under /projects
    $projects = Get-ChildItem -Path projects -Directory

    # Check if any projects were found
    if ($projects.Count -eq 0) {
        Write-Host "No projects found."
        return $null
    }

    # If there is only one project, return it
    if ($projects.Count -eq 1) {
        return $projects[0].Name
    }

    # Prompt the user to select a project
    $i = 1
    Write-Host "Select a project:"
    $projects | ForEach-Object {
        Write-Host "$i. $($_.Name)"
        $i++
    }

    # Read the user input
    $choice = Read-Host "Enter the project number"

    # Validate the user input
    if ($choice -ge 1 -and $choice -le $projects.Count) {
        return $projects[$choice - 1].Name
    } else {
        Write-Host "Invalid choice. Please try again."
        return $null
    }

    return $null
}
