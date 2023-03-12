import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'

import List from '@/pages/list.vue'
import Home from '@/pages/home.vue'
import Detail from '@/pages/detail.vue'

// 2. Define some routes
// Each route should map to a component.
// We'll talk about nested routes later.
const routes = [
  { path: '/', component: List },
  { path: '/places', component: List },
  { path: '/places/:placeId', component: Detail },

  // Catch all path
  // { path: '/:pathMatch(.*)*', redirect: '/'}
]

// 3. Create the router instance and pass the `routes` option
// You can pass in additional options here, but let's
// keep it simple for now.
const router = createRouter({
  // 4. Provide the history implementation to use. We are using the hash history for simplicity here.
  history: createWebHistory(),
  routes, // short for `routes: routes`
})

// 5. Create and mount the root instance.
const app = createApp(Home)
// Make sure to _use_ the router instance to make the
// whole app router-aware.
app.use(router)
app.mount('#vue-app')
