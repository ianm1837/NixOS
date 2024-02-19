import { $ } from "bun"

const allWorkspaces = await $`swaymsg -r -t get_workspaces`.json()

const arrOfWorkspaces = allWorkspaces.map((workspace) => {
    return{
        name: workspace.name,
        output: workspace.output,
        focused: workspace.focused
    }
})

const highestNumber = arrOfWorkspaces.reduce((highestNum, currentObj) => {
    const currentNum = parseInt(currentObj.name);
    return currentNum > highestNum ? currentNum : highestNum;
}, parseInt(arrOfWorkspaces[0].name));

console.log('highestNumber: ', highestNumber)

//const focusedMonitor = arrOfWorkspaces.reduce((focusedMon, currentObj) => {
//    return currentObj.focused ? currentObj.output : focusedMon.output
//})

async function createWorkspaceFocusedMonitor(){
    await $`sway workspace ${highestNumber + 1}`
}

async function moveWindowToNewWorkspaceOnFocusedMonitor(){
    await $`sway move container to workspace ${highestNumber + 1}`
    await $`sway workspace ${highestNumber +1}`
}


async function nextEvenIfEmpty(){

}

async function prevEvenIfEmpty(){

}

function showHelp(){

    // colors
    //
    // Black:   \u001b[30m
    // Red:     \u001b[31m
    // Green:   \u001b[32m
    // Yellow:  \u001b[33m
    // Blue:    \u001b[34m
    // Magenta: \u001b[35m
    // Cyan:    \u001b[36m
    // White:   \u001b[37m
    // Reset:   \u001b[0m

    console.log(`
\u001b[35mSwayspcae \u001b[37mis a utility used to modify and create Workspaces in Sway. 

Usage: swayspace \u001b[36m<command>

\u001b[37mCommands:

    \u001b[32mnew           \u001b[37mcreates a new empty workspace on the focused monitor

    \u001b[32mmovetonew     \u001b[37mcreates a new empty workspace on the focused monitor
                  and moves the focused window
        `)
    
    process.exit()
}

if (process.argv[3]){
    console.error('only one argument is supported')
    process.exit(1)
}

switch (process.argv[2]){
    case 'new':
        createWorkspaceFocusedMonitor()
        break
    case 'movetonew':
        moveWindowToNewWorkspaceOnFocusedMonitor()
        break
    default:
        showHelp()
        break
}
