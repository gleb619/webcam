/*
 * 
 */
package org.test.webcam.config;

import java.util.Collection;

import net.sf.ehcache.config.CacheConfiguration;
import net.sf.ehcache.config.DiskStoreConfiguration;

import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.annotation.CachingConfigurer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.test.webcam.config.settings.CacheSettings;

// TODO: Auto-generated Javadoc
/**
 * The Class CacheConfig.
 */
@EnableCaching
public class CacheConfig {

	/** The debug. */
	private Boolean debug = false; 
//			Settings.CACHE_CONFIG.getValue();
	
	/**
	 * Eh cache manager.
	 *
	 * @return the net.sf.ehcache. cache manager
	 */
	@SuppressWarnings("deprecation")
	@Bean(destroyMethod="shutdown")
    public net.sf.ehcache.CacheManager ehCacheManager() {
        CacheConfiguration cacheConfiguration = new CacheConfiguration();
        cacheConfiguration.setMemoryStoreEvictionPolicy("LRU");
        cacheConfiguration.setMaxEntriesLocalHeap(1000);
        cacheConfiguration.setEternal(false);
        cacheConfiguration.setOverflowToDisk(true);
        cacheConfiguration.setMaxElementsInMemory(1000);
        cacheConfiguration.setMaxElementsOnDisk(10000);
//        cacheConfiguration.setDiskPersistent(false);
//        cacheConfiguration.setStatistics(false);
        cacheConfiguration.setTimeToIdleSeconds(300);
        cacheConfiguration.setTimeToLiveSeconds(600);

        net.sf.ehcache.config.Configuration config = new net.sf.ehcache.config.Configuration();
        DiskStoreConfiguration diskStoreConfiguration = new DiskStoreConfiguration();
        diskStoreConfiguration.setPath(System.getProperty("java.io.tmpdir"));
        config.diskStore(diskStoreConfiguration);
        config.setDynamicConfig(true);
        config.setMonitoring("autodetect");
        config.setUpdateCheck(false);
        config.defaultCache(cacheConfiguration);
        
    	CacheSettings.Items.list.parallelStream().forEach(it -> {
    		config.addCache(loadCache(it));
    	});

        return net.sf.ehcache.CacheManager.newInstance(config);
    }

	/**
	 * Load cache.
	 *
	 * @param name the name
	 * @return the cache configuration
	 */
	private CacheConfiguration loadCache(String name) {
		CacheConfiguration cacheConfiguration = new CacheConfiguration();
        cacheConfiguration.setMemoryStoreEvictionPolicy("LRU");
        cacheConfiguration.setMaxEntriesLocalHeap(10000);
        cacheConfiguration.setMaxEntriesLocalDisk(1000000);
        if (debug) {
        	cacheConfiguration.setTimeToIdleSeconds(10);
        	cacheConfiguration.setTimeToLiveSeconds(20);
		}
        else {
        	cacheConfiguration.setTimeToIdleSeconds(60);
        	cacheConfiguration.setTimeToLiveSeconds(120);
        }
        cacheConfiguration.setName(name);
        
        return cacheConfiguration;
	}
	
    /* (non-Javadoc)
     * @see org.springframework.cache.annotation.CachingConfigurer#cacheManager()
     */
    @Bean
    public CacheManager cacheManager() {
//    	if (debug) {
//    		return new ConcurrentMapCacheManager();
//		} else {
//			return new EhCacheCacheManager(ehCacheManager());
//    	}
		return new EhCacheCacheManager(ehCacheManager());
    }

}
