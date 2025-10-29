<script setup lang="ts">
import { onMounted, watch } from 'vue'
import BackToTop from '@/components/other/BackTop.vue'
import GlobalModel from '@/components/modal/index.vue'
import AppHeader from '@/components/layout/AppHeader.vue'
import AppFooter from '@/components/layout/AppFooter.vue'
import { useAppStore, useUserStore } from '@/store'
import { useWindowScroll } from '@vueuse/core'
import { useDebounceFn } from '@vueuse/core'

const [appStore, userStore] = [useAppStore(), useUserStore()]

// 获取滚动条位置
const { y } = useWindowScroll()

// 创建防抖函数来设置导航栏透明度
const updateNavOpacity = useDebounceFn(() => {
  appStore.setNavOpacity(Math.min(y.value / 300, 1))
}, import.meta.env.DEV ? 100 : 50)

// 监听滚动位置变化
watch(y, updateNavOpacity)

onMounted(() => {
  appStore.getBlogInfo()
  userStore.getUserInfo()
})
</script>

<template>
  <AppProvider>
    <div wh-full flex-col>
      <!-- 顶部导航栏 -->
      <AppHeader />
      <!-- 中间内容(包含底部信息) -->
      <article flex-1 flex-col>
        <router-view v-slot="{ Component, route }">
          <component :is="Component" :key="route.path" />
        </router-view>
      </article>
    </div>
    <!-- 回到顶部 -->
    <BackToTop />
    <!-- 全局弹窗 -->
    <GlobalModel />
  </AppProvider>
</template>
