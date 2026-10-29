//go:build windows

package capture

import (
	"os"
	"os/exec"
)

func setProcessGroup(cmd *exec.Cmd) {
	// On Windows, child processes are managed by the OS or standard process handling.
}

func killProcessGroupOS(pgid int) {
	if pgid <= 0 {
		return
	}
	p, err := os.FindProcess(pgid)
	if err == nil && p != nil {
		_ = p.Kill()
	}
}
