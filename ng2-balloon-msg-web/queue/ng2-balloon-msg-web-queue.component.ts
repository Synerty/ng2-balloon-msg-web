import {Component} from "@angular/core";
import {Ng2BalloonMsgCommonQueueComponent} from "@synerty/ng2-balloon-msg";
import {Ng2BalloonMsgService} from "@synerty/ng2-balloon-msg";

@Component({
    selector: 'ng2-balloon-msg',
    templateUrl: './ng2-balloon-msg-web-queue.component.html',
    styleUrls: ['./ng2-balloon-msg-web-queue.component.css']
})
export class Ng2BalloonMsgQueueComponent extends Ng2BalloonMsgCommonQueueComponent {

    constructor(msgService: Ng2BalloonMsgService) {
        super(msgService);
    }

}
