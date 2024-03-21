section .data
    arg:                        db 0                ;just NULL for the REBOOT

    ; magic reboot constants
    linux_reboot_magic1:        equ 0xfee1dead      ;feel dead ;-)
    linux_reboot_magic2:        equ 0x28121969      ;Linus Torvalds's birthday
    linux_reboot_magic2a:       equ 0x05121996      ;Patricia Miranda Torvalds's birthday
    linux_reboot_magic2b:       equ 0x16041998      ;Daniela Yolanda Torvalds's birthday
    linux_reboot_magic2c:       equ 0x20112000      ;Celeste Amanda Torvalds's birthday


; Commands accepted by the _reboot() system call.
;
; RESTART     Restart system using default command and mode.
;             (RB_AUTOBOOT, 0x1234567).  The message "Restarting
;             system." is printed, and a default restart is performed
;             immediately.  If not preceded by a sync(2), data will be
;             lost.
;
; HALT        Stop OS and give system control to ROM monitor, if any.
;             (RB_HALT_SYSTEM, 0xcdef0123; since Linux 1.1.76).  The
;             message "System halted." is printed, and the system is
;             halted.  Control is given to the ROM monitor, if there is
;             one.  If not preceded by a sync(2), data will be lost.
;
; CAD_ON      Ctrl-Alt-Del sequence causes RESTART command.
;             (RB_ENABLE_CAD, 0x89abcdef).  CAD is enabled.  This means
;             that the CAD keystroke will immediately cause the action
;             associated with LINUX_REBOOT_CMD_RESTART.
;
; CAD_OFF     Ctrl-Alt-Del sequence sends SIGINT to init task.
;             (RB_DISABLE_CAD, 0).  CAD is disabled.  This means that
;             the CAD keystroke will cause a SIGINT signal to be sent to
;             init (process 1), whereupon this process may decide upon a
;             proper action (maybe: kill all processes, sync, reboot).
;
; POWER_OFF   Stop OS and remove all power from system, if possible.
;             (RB_POWER_OFF, 0x4321fedc; since Linux 2.1.30).  The
;             message "Power down." is printed, the system is stopped,
;             and all power is removed from the system, if possible.  If
;             not preceded by a sync(2), data will be lost.
;
; RESTART2    Restart system using given command string.
;             (0xa1b2c3d4; since Linux 2.1.30).  The message "Restarting
;             system with command '%s'" is printed, and a restart (using
;             the command string given in arg) is performed immediately.
;             If not preceded by a sync(2), data will be lost.
;
; SW_SUSPEND  Suspend system using software suspend if compiled in.
;             (RB_SW_SUSPEND, 0xd000fce1; since Linux 2.5.18).  The
;             system is suspended (hibernated) to disk.  This option is
;             available only if the kernel was configured with
;             CONFIG_HIBERNATION.
;
; KEXEC       Restart system using a previously loaded Linux kernel
;             (RB_KEXEC, 0x45584543, since Linux 2.6.13).  Execute a
;             kernel that has been loaded earlier with kexec_load(2).
;             This option is available only if the kernel was configured
;             with CONFIG_KEXEC.

    linux_reboot_cmd_restart:   equ 0x01234567
    linux_reboot_cmd_halt:      equ 0xCDEF0123
    linux_reboot_cmd_cad_on:    equ 0x89ABCDEF
    linux_reboot_cmd_cad_off:   equ 0x00000000
    linux_reboot_cmd_power_off: equ 0x4321FEDC
    linux_reboot_cmd_restart2:  equ 0xA1B2C3D4
    linux_reboot_cmd_sw_suspend:equ 0xD000FCE2
    linux_reboot_cmd_kexec:     equ 0x45584543

    ; syscalls
    sys_sync:                   equ 0x24
    sys_reboot:                 equ 0x58

    ; interrupts
    int_kernel:                 equ 0x80

section .text
    global _start

_start:
; sync 3 times first
                                mov eax,sys_sync
                                int int_kernel
                                mov eax,sys_sync
                                int int_kernel
                                mov eax,sys_sync
                                int int_kernel

; the reboot itself
                                mov eax,sys_reboot
                                mov ebx,linux_reboot_magic1
                                mov ecx,linux_reboot_magic2
                                mov edx,linux_reboot_cmd_restart
                                mov esi,arg
                                int int_kernel
