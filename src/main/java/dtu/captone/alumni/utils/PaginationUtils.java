package dtu.captone.alumni.utils;

import dtu.captone.alumni.constant.CommonConstants;

public final class PaginationUtils {

	public static int getOffset(int currentPage) {
		return (currentPage -1 ) * CommonConstants.LIMIT_PAGE_ADMIN;
	}
	public static int getOffsetSearch(int currentPage) {
		return (currentPage -1 ) * CommonConstants.LIMIT_PAGE_ADMIN;
	}
	public static int getOffsetCat(int currentPage) {
		return (currentPage -1 ) * CommonConstants.LIMIT_PAGE_ADMIN;
	}
	
	public static int getOffset(int currentPage ,int limit) {
		return (currentPage -1 ) * limit;
	}
}
