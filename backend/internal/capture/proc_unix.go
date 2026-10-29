//go:build !windows

package capture

import (
	"log"
	"os/exec"
	"syscall"
)

func setProcessGroup(cmd *exec.Cmd) {
	cmd.SysProcAttr = &syscall.SysProcAttr{Setpgid: true}
}

func killProcessGroupOS(pgid int) {
	if pgid <= 0 {
		return
	}
	if err := syscall.Kill(-pgid, syscall.SIGKILL); err != nil && err != syscall.ESRCH {
		log.Printf("⚠️ preflight: failed to kill probe process group %d: %v", pgid, err)
	}
}
