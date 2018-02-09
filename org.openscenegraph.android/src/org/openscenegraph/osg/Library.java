/* @License 
 -------------------------------------------------------------------------------
 | osgAndroid - Copyright (C) 2012 Rafael Gait�n, Mirage Technologies S.L.     |
 |                                                                             |
 | This library is free software; you can redistribute it and/or modify        |
 | it under the terms of the GNU Lesser General Public License as published    |
 | by the Free Software Foundation; either version 3 of the License, or        |
 | (at your option) any later version.                                         |
 |                                                                             |
 | This library is distributed in the hope that it will be useful, but         |
 | WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY  |
 | or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public     |
 | License for more details.                                                   |
 |                                                                             |
 | You should have received a copy of the GNU Lesser General Public License    |
 | along with this software; if not, write to the Free Software Foundation,    |
 | Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.               |
 ---------------------------------------------------------------------------- */
package org.openscenegraph.osg;

import android.util.Log;

public class Library {
	private static boolean initialized = false;
	private static String TAG = "OpenSceneGraph-Android Library";

	public static void initLibrary(String glesVersion) {
		try {
			if (!initialized) {
				//System.loadLibrary("gnustl_shared");
				System.loadLibrary("jniosg-"+ glesVersion);
				Log.i(TAG, "Successfully initialized");
				initialized = true;
			}
		} catch (Exception e) {
			Log.e(TAG, e.getMessage());
		}
	}
}
