const isBrowser = typeof window !== `undefined`

const getUser = () =>
    window.localStorage.cryptowiseUser ?
    JSON.parse(window.localStorage.cryptowiseUser) : {}

const setUser = user => (window.localStorage.cryptowiseUser = JSON.stringify(user))

export const handleLogin = ({
    username,
    password
}) => {
    if (!isBrowser) return false

    if (username === `cryptowise` && password === `demo`) {
        console.log(`Credentials match! Setting the active user.`)
        return setUser({
            name: `Tugi`,
            legalName: `Tuguldur Bayarnyam`,
            email: `tuguscript@gmail.com`,
        })
    }

    return false
}

export const isLoggedIn = () => {
    if (!isBrowser) return false

    const user = getUser()

    return !!user.email
}

export const getCurrentUser = () => isBrowser && getUser()

export const logout = callback => {
    if (!isBrowser) return

    console.log(`Ensuring the \`cryptowiseUser\` property exists.`)
    setUser({})
    callback()
}