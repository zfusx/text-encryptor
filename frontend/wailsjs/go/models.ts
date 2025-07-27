export namespace main {
	
	export class EncryptionResult {
	    encryptedText: string;
	    success: boolean;
	    error: string;
	
	    static createFrom(source: any = {}) {
	        return new EncryptionResult(source);
	    }
	
	    constructor(source: any = {}) {
	        if ('string' === typeof source) source = JSON.parse(source);
	        this.encryptedText = source["encryptedText"];
	        this.success = source["success"];
	        this.error = source["error"];
	    }
	}

}

