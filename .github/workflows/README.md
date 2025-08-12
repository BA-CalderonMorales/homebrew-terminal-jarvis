# GitHub Actions Workflows

This directory contains automated workflows for maintaining the Terminal Jarvis Homebrew formula.

## Architecture

The workflows use a **composite action** (`.github/actions/update-formula`) to eliminate code duplication and ensure consistency between scheduled and manual updates.

### Structure
```
.github/
├── actions/
│   └── update-formula/
│       └── action.yml          # Reusable composite action
└── workflows/
    ├── scheduled-update.yml    # Weekly automated updates  
    ├── manual-update.yml       # On-demand manual updates
    └── README.md              # This documentation
```

## Composite Action: `update-formula`

**Location:** `.github/actions/update-formula/action.yml`

### Purpose
Central, reusable logic for updating the Terminal Jarvis Homebrew formula. Both workflows use this same action to ensure consistency.

### Inputs
- `version` (optional): Specific version to update to
- `force-update` (boolean): Force update even if already up to date

### Outputs
- `current-version`: Version before update
- `target-version`: Target version for update
- `update-needed`: Whether an update was needed
- `files-changed`: Whether any files were modified

### Features
- **Single Source of Truth**: All update logic in one place
- **Version Validation**: Ensures specified versions exist
- **Smart Updates**: Only updates when necessary
- **Checksum Calculation**: Automatic SHA256 for Mac/Linux archives
- **Error Handling**: Comprehensive validation and error reporting
- **Script Integration**: Uses existing `scripts/update-formula.sh`

## Scheduled Update Workflow

**File:** `scheduled-update.yml`

### Purpose
Automatically checks for new Terminal Jarvis releases every Sunday and creates a Pull Request if an update is available.

### Schedule
- **When:** Every Sunday at 9:00 AM UTC
- **Trigger:** Automatic via GitHub Actions cron schedule
- **Manual Trigger:** Can also be triggered manually from the Actions tab

### Behavior
1. Uses the `update-formula` composite action
2. Checks for the latest release automatically
3. If an update is available, creates a Pull Request
4. If already up to date, no action is taken

### Inputs (Manual Trigger Only)
- `force_update` (boolean): Force update even if already up to date

## Manual Update Workflow

**File:** `manual-update.yml`

### Purpose
Provides on-demand updating of the Homebrew formula with flexible options.

### Trigger
Manual only - accessible from the GitHub Actions tab with "Run workflow" button.

### Inputs
- `version` (string, optional): Specific version to update to (e.g., "0.0.54"). Leave empty for latest release.
- `force_update` (boolean): Force update even if already up to date
- `create_pr` (boolean): Create a Pull Request instead of pushing directly to develop

### Behavior
1. Uses the same `update-formula` composite action
2. Supports both latest version and specific version updates
3. Can create PR or push directly based on preferences
4. Provides comprehensive feedback on the update process

## How They Work

### Shared Logic (Composite Action)
- Environment setup (installs `jq`, `curl`)
- Git configuration
- Version validation and comparison
- Archive verification and checksum calculation
- Formula file updates using existing scripts

### Script Integration
Both workflows seamlessly integrate with your existing `scripts/` directory:
- `scripts/setup.sh`: Prerequisites validation
- `scripts/update-formula.sh`: Main update logic for latest releases
- Custom version-specific logic when targeting specific versions

### Key Improvements
- **No Code Duplication**: Single composite action used by both workflows
- **Consistent Behavior**: Same logic for scheduled and manual updates
- **Maintainable**: Changes to update logic only need to be made in one place
- **Testable**: Composite action can be tested independently
- **Flexible**: Supports both latest and specific version updates

## Usage Examples

### Scheduled Updates (Automatic)
No action required - runs every Sunday automatically.

### Manual Updates

#### Update to Latest Release (with PR)
1. Go to Actions → Manual Formula Update
2. Click "Run workflow"
3. Leave all inputs as default
4. Click "Run workflow"

#### Update to Specific Version (with PR)
1. Go to Actions → Manual Formula Update
2. Click "Run workflow"
3. Set `version` to desired version (e.g., "0.0.54")
4. Leave other inputs as default
5. Click "Run workflow"

#### Force Update with Direct Push
1. Go to Actions → Manual Formula Update
2. Click "Run workflow"
3. Set `force_update` to true
4. Set `create_pr` to false
5. Click "Run workflow"

## Permissions

Both workflows require:
- `contents: write` - To push commits and create branches
- `pull-requests: write` - To create and manage pull requests

These are automatically granted via `GITHUB_TOKEN`.

## Benefits of the New Architecture

1. **DRY Principle**: No duplicated code between workflows
2. **Single Source of Truth**: All update logic centralized in composite action
3. **Easy Maintenance**: Update logic only needs to be changed in one place
4. **Consistent Behavior**: Both workflows behave identically for core operations
5. **Testable**: Composite action can be independently tested
6. **Reusable**: Action could be used by other workflows if needed
7. **Clear Separation**: Workflow-specific logic separate from update logic
