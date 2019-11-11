import common, { sillyname } from '@app/common'

const helloable = () => console.log(`Hello ${common} it's ${sillyname()}`)

setInterval(helloable, 2000)

console.log('started')
helloable()
